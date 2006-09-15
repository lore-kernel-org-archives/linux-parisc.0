From: Joel Soete <soete.joel@scarlet.be>
Subject: [parisc-linux] the 53c700 driver pb on c110/d380
Date: Fri, 15 Sep 2006 11:10:07 +0000
Message-ID: <450A8A0F.5070902@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: Parisc List <parisc-linux@lists.parisc-linux.org>,
 James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello James,

as well on c110 as on d380 I always get following pb with this driver for the ncr53c710 chip (scsi narrow s-e external 
connection), after 2 or 3 untar/rm iterations (obviously this is just an easy way to reproduce this pb which hapen more 
frequently in day to day life cycle):

Aug 26 07:37:48 patst007 kernel: scsi3: (3:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
Aug 26 07:37:48 patst007 kernel: scsi3: Bus Reset detected, executing command 1f7c5080, slot 1f6f0778, dsp 000d01e8[01e8]
Aug 26 07:37:48 patst007 kernel:  failing command because of reset, slot 1f6f0520, cmnd 1f5d7a80
Aug 26 07:37:48 patst007 kernel:  failing command because of reset, slot 1f6f064c, cmnd 1f5d7060
Aug 26 07:37:48 patst007 kernel:  failing command because of reset, slot 1f6f0778, cmnd 1f7c5080
Aug 26 07:37:48 patst007 kernel:  failing command because of reset, slot 1f6f08a4, cmnd 1f7c51a0
Aug 26 07:37:50 patst007 kernel: scsi3: (3:0) phase mismatch at 01e8, phase IO BSY DATA_IN
Aug 26 07:37:50 patst007 kernel: scsi3: Bus Reset detected, executing command 1f5d7a80, slot 1f6f08a4, dsp 000d01e8[01e8]
Aug 26 07:37:50 patst007 kernel:  failing command because of reset, slot 1f6f0520, cmnd 1f7c51a0
Aug 26 07:37:50 patst007 kernel:  failing command because of reset, slot 1f6f064c, cmnd 1f7c5080
Aug 26 07:37:50 patst007 kernel:  failing command because of reset, slot 1f6f0778, cmnd 1f5d7060
Aug 26 07:37:50 patst007 kernel:  failing command because of reset, slot 1f6f08a4, cmnd 1f5d7a80
--- snip ---
Aug 26 07:53:51 patst007 kernel: scsi3: (3:0) phase mismatch at 01e8, phase IO BSY DATA_IN
Aug 26 07:53:51 patst007 kernel: scsi3: Bus Reset detected, executing command 1f5d7a80, slot 1f6f08a4, dsp 000d01e8[01e8]
Aug 26 07:53:51 patst007 kernel:  failing command because of reset, slot 1f6f0520, cmnd 1f7c51a0
Aug 26 07:53:51 patst007 kernel:  failing command because of reset, slot 1f6f064c, cmnd 1f7c5080
Aug 26 07:53:51 patst007 kernel:  failing command because of reset, slot 1f6f0778, cmnd 1f5d7060
Aug 26 07:53:51 patst007 kernel:  failing command because of reset, slot 1f6f08a4, cmnd 1f5d7a80

(I grabe it from kernel log to show the timestamp)

Some I had to force the reboot of system, some other it panics with some "ccio_alloc_range() I/O MMU..."
(most probably "I/O MMU is out of mapping resources.")

Any idea why this 'phase mismatch' hapened?

Tia,
	Joel

PS: btw I just start to look in more details code but I don't undertand how this hunk:

#ifdef NCR_700_DEBUG
#define STATIC
#else
#define STATIC static
#endif

would help debuging? (I understand that __inline__ would be remove but static?)

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
