From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] ncr53c8xx 64bit verbose boot info
Date: Sat, 21 May 2005 14:46:56 +0000
Message-ID: <428F49E0.6070004@tiscali.be>
References: <4282FEEC00003588@mail-2-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: James Bottomley <James.Bottomley@SteelEye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4282FEEC00003588@mail-2-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Joel Soete wrote:
> Hello James,
> 
> 
>>On Fri, 2005-05-20 at 19:16 +0200, Joel Soete wrote:
>>
>>>Btw I also have an external bootable disk narrow SE connected to the
> 
> s710
> 
>>>driver. Do you know if this one is 64bit capable?
>>
>>The lasi700 driver works fine in a 64 bit kernel, yes.
>>
> 
> Cool, I will so be able to test more (sorry not next week (i will be on training)
> but next one) ;-)
> 
> btw any idea as starting point of investigation to make ncr53c8xx driver
> 64bit capable?
> (a mail ref, ...)
> 

Ah I remember that ncr verbose (iirc 3) boot info collected:
32bit kernel:
[...]
zalon_probe: Zalon version 1, IRQ 67
ncr53c720-0: rev 0xf irq 67
ncr53c720-0: using memory mapped IO at virtual address 0xf1004800
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
ncr53c720-0: initial SCNTL3/DMODE/DCNTL/CTEST3/4/5 = (hex) 00/00/20/00/80/00
ncr53c720-0: final   SCNTL3/DMODE/DCNTL/CTEST3/4/5 = (hex) 03/80/20/00/88/00
ncr53c720-0: resetting, command processing suspended for 2 seconds
ncr53c720-0: restart (scsi reset).

scsi0 : ncr53c8xx-3.4.3g
ncr53c720-0: command processing resumed
   Vendor: SEAGATE   Model: ST39173WC         Rev: HP11
   Type:   Direct-Access                      ANSI SCSI revision: 02
  0:0:5:0: tagged command queue depth set to 8
  target0:0:5: Beginning Domain Validation
[...]

64bit:
[...]
zalon_probe: Zalon version 1, IRQ 66
ncr53c720-0: rev 0xf irq 66
ncr53c720-0: using memory mapped IO at virtual address 0xfffffffff1004800
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
ncr53c720-0: initial SCNTL3/DMODE/DCNTL/CTEST3/4/5 = (hex) 00/00/20/00/80/00
ncr53c720-0: final   SCNTL3/DMODE/DCNTL/CTEST3/4/5 = (hex) 03/80/20/00/88/00
ncr53c720-0: resetting, command processing suspended for 2 seconds
ncr53c720-0: restart (scsi reset).

scsi0 : ncr53c8xx-3.4.3g
ncr53c720-0: command processing resumed
    # till there all seems ok but after?
ncr53c720-0: resetting, command processing suspended for 2 seconds
ncr53c720-0: restart (scsi reset).
ncr53c720-0: command processing resumed
scsi: Device offlined - not ready after error recovery: host 0 channel 0 id 0 lu
n 0
ncr53c720-0: resetting, command processing suspended for 2 seconds
ncr53c720-0: restart (scsi reset).
ncr53c720-0: command processing resumed
scsi: Device offlined - not ready after error recovery: host 0 channel 0 id 5 lu
n 0
ncr53c720-0: resetting, command processing suspended for 2 seconds
...hung here

mmm strange in 32bit zalon_probe() used IRQ 67 while the 64bit used IRQ 66, is that important?

Thanks,
     Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
