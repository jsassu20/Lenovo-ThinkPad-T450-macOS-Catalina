/*
 * Created: 23 August 2015
 * Name...: csrstat.c
 * Author.: Pike R. Alpha
 * Purpose: Command line tool for El Capitan and greater to get the active SIP status.
 *
 * Compile with: cc csrstat.c -o csrstat
 * 
 * Updates:
 *			- use csr_check so that csr_allow_all/internal are taken into account (Pike R. Alpha, September 2015).
 *			- added macOS Sierra 10.12 compatibilty (Pike R. Alpha, July 2016).
 *			- added macOS High Sierra 10.13 compatibilty (Pike R. Alpha, June 2017).
 *			- header added (Pike R. Alpha, September 2017).
 *			- fixed two errors.
 *			- no longer using _csr_check from the kernel, because it checks for specific settings.
 *			- renamed CSR_ALLOW_USER_APPROVED_KEXTS to CSR_ALLOW_UNAPPROVED_KEXTS.
 *			- flip output of 'Device Configuration'.
 *			- changed the text of the CSR_ALLOW_UNAPPROVED_KEXTS setting.
 */

#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <strings.h>

typedef uint32_t csr_config_t;

char *text = NULL;
double gVersion = 1.8;
csr_config_t config = 0;

/* Rootless configuration flags */
#define CSR_ALLOW_UNTRUSTED_KEXTS		(1 << 0)	// 1
#define CSR_ALLOW_UNRESTRICTED_FS		(1 << 1)	// 2
#define CSR_ALLOW_TASK_FOR_PID			(1 << 2)	// 4
#define CSR_ALLOW_KERNEL_DEBUGGER		(1 << 3)	// 8
#define CSR_ALLOW_APPLE_INTERNAL		(1 << 4)	// 16
#define CSR_ALLOW_UNRESTRICTED_DTRACE	(1 << 5)	// 32
#define CSR_ALLOW_UNRESTRICTED_NVRAM	(1 << 6)	// 64
#define CSR_ALLOW_DEVICE_CONFIGURATION	(1 << 7)	// 128
#define CSR_ALLOW_ANY_RECOVERY_OS		(1 << 8)	// 256
#define CSR_ALLOW_UNAPPROVED_KEXTS		(1 << 9)	// 512

#define CSR_VALID_FLAGS (CSR_ALLOW_UNTRUSTED_KEXTS | \
	CSR_ALLOW_UNRESTRICTED_FS | \
	CSR_ALLOW_TASK_FOR_PID | \
	CSR_ALLOW_KERNEL_DEBUGGER | \
	CSR_ALLOW_APPLE_INTERNAL | \
	CSR_ALLOW_UNRESTRICTED_DTRACE | \
	CSR_ALLOW_UNRESTRICTED_NVRAM  | \
	CSR_ALLOW_DEVICE_CONFIGURATION | \
	CSR_ALLOW_ANY_RECOVERY_OS | \
	CSR_ALLOW_UNAPPROVED_KEXTS)

/* Syscalls */
extern int csr_get_active_config(csr_config_t *config);

//==============================================================================

char * _csr_check(int aMask, bool aFlipflag)
{
	bool stat = false;
	bool bit = (config & aMask);
	
	if (aFlipflag)
	{
		if (bit)
		{
			sprintf(text, "%d (disabled)", bit);
		}
		else
		{
			sprintf(text, "%d (enabled)", bit);
		}
	}
	else
	{
		if (bit)
		{
			sprintf(text, "%d (enabled)", bit);
		}
		else
		{
			sprintf(text, "%d (disabled)", bit);
		}
	}
	
	return text;
}

//==============================================================================

int main(int argc, const char * argv[])
{
	time_t t = time(NULL);
	struct tm tm = *localtime(&t);
	text = malloc(12);
	bzero(text, 12);
	// Syscall
	csr_get_active_config(&config);
	
	printf("csrstat v%.1f Copyright (c) 2015-%d by Pike R. Alpha\n", gVersion, (tm.tm_year + 1900));
	//
	// Note: boot.efi is no longer using 0x67 but 0x77 for csrutil disabled!!!
	//
	printf("System Integrity Protection status: %s (0x%08x) ", (config == CSR_VALID_FLAGS) ? "\33[1mdisabled\33[0m": "enabled", config);

	if (config)
	{
		if (config == CSR_ALLOW_APPLE_INTERNAL)
		{
			printf("(Apple Internal).");
		}
		else
		{
			printf("(Custom Configuration).");
		}
	}
	
	printf("\n\nConfiguration:\n");

	printf("\tApple Internal...........: %s\n", _csr_check(CSR_ALLOW_APPLE_INTERNAL, 0));
	printf("\tKext Signing Restrictions: %s\n", _csr_check(CSR_ALLOW_UNTRUSTED_KEXTS, 1));
	printf("\tTask for PID Restrictions: %s\n", _csr_check(CSR_ALLOW_TASK_FOR_PID, 1));
	printf("\tFilesystem Protections...: %s\n", _csr_check(CSR_ALLOW_UNRESTRICTED_FS, 1));
	printf("\tDebugging Restrictions...: %s\n", _csr_check(CSR_ALLOW_KERNEL_DEBUGGER, 1));
	printf("\tDTrace Restrictions......: %s\n", _csr_check(CSR_ALLOW_UNRESTRICTED_DTRACE, 1));
	printf("\tNVRAM Protections........: %s\n", _csr_check(CSR_ALLOW_UNRESTRICTED_NVRAM, 1));
	printf("\tDevice Configuration.....: %s\n", _csr_check(CSR_ALLOW_DEVICE_CONFIGURATION, 0));
	printf("\tBaseSystem Verification..: %s\n", _csr_check(CSR_ALLOW_ANY_RECOVERY_OS, 1));
	printf("\tAllow Unapproved Kexts...: %s\n", _csr_check(CSR_ALLOW_UNAPPROVED_KEXTS, 1));
	
	if (config && (config != CSR_ALLOW_APPLE_INTERNAL))
	{
		printf("\nThis is an unsupported configuration, likely to break in the future and leave your machine in an unknown state.\n");
	}
	if (text)
	{
		free(text);
	}
	exit(-1);
}
