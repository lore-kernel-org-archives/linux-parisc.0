Return-Path: <hppa-linux@puffingroup.com>
Date: Fri, 19 Feb 1999 13:29:01 -0600
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199902191929.NAA11346@equator.com>
To: hppa-linux@puffingroup.com, jason@equator.com
Subject: [hppa-linux] Partitioning proposal for boot loader
Resent-Message-ID: <"yXqeZ.0.rS7.UoRps"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


Now that the prelimary bootstrap test appears to work, I am preparing to
do the necessary work for actually loading the (future) kernel image.

As I mentioned in previous mailings, the bootloader needs to understand how
to find the kernel on the disk. 
I propose that for the near-term, we use a simple PC-like partition scheme
for HPPA/Linux. In the future, once Linux is up and running,
we can work on co-existing with HP-UX on the same physical disk (see below
for more on this). This will keep the bootloader very small and simple,
and allow us to quickly move to working on the hard part, the actual kernel.

My idea is to create simple partition table structure which would contain
(for each partition) the starting sector, length, and perhaps a flag word.
This table would be of fixed length (say 16 entries) and be stored at a
known place near the beginning of the disk.

The kernel itself could be stored in a non-filesystem partition (i.e. just
a raw partition) so the bootloader only has to read in the data and not
have need a standalone filesystem.

Unless there are strong objections, I will proceed with the coding of this
scheme over the weekend.

Regards, Jason.

----------------------------------------------------------------------------
HP partition information (fyi):

After investigating my 10.20 drive, and some HPUX header files, I think
I understand (at least partially) how the partition scheme works.
Unfortunately, it doesn't appear to me that their scheme allows another OS
to coexist peacefully on the same disk.
Basically, they store a partial partition table in the LIF directory of the
disk in a LIF file called LABEL. The table only contains information for
4 partitions -- BOOT, ROOT, SWAP, DUMP. This is enough for the hpux loader
to find the kernel image and boot. It seems that the LVM partition information
is internal to HPUX itself.  LVM only seems to 'export' the info for the
4 partitions mentioned above into the LABEL file, even if LVM has setup
more partitions.

What it amounts to, is that it would be easy for the bootloader to read the
LIF directory, pick up file LABEL, and get the partition information. But
if we write our own entry into the table, we would clobber some other LVM
partitions since they aren't reflected in the table.

Its a little strange. If someone from HP (or someone who ACTUALLY knows this
stuff) thinks I missed whats happening, please let me know. This is what I
could get from looking at hex/ascii dumps of the lif volume and a few header
files...

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
