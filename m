From: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Subject: HPPA64: Cannot write to ext4 filesystems with files > 28672 byte
Date: Mon, 27 Feb 2012 15:55:46 +0100
Message-ID: <51659a45a16b0a5b0ede44e3f3e830dc.squirrel@webmail.sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Recent kernels (>3.x) fail when writing to ext4 filesystems with the
message "file too large". The critical size is 28672 byte (7*2^12). This
has been traced down to ext4_max_size() by Tobias Ulmer, which looks like
this:

fs/ext4/super.c, comments stripped:

loff_t ext4_max_size(int blkbits, int has_huge_files)
{
	loff_t res;
	loff_t upper_limit = MAX_LFS_FILESIZE;

	if (!has_huge_files || sizeof(blkcnt_t) < sizeof(u64)) {
		upper_limit = (1LL << 32) - 1;

		upper_limit >>= (blkbits - 9);
		upper_limit <<= blkbits;
	}

	res = (1LL << 32) - 1;
	res <<= blkbits;

	if (res > upper_limit)
		res = upper_limit;

	return res;
}

The 64 assembler output using gcc for 64 bit looks like this:

0000000000000000 <ext4_max_size>:
   0:   37 de 00 80     ldo 40(sp),sp
   4:   8f 20 20 80     cmpib,<> 0,r25,4c <ext4_max_size+0x4c>
   8:   db 5c 0f e0     extrd,s,* r26,63,32,ret0
   c:   97 9c 00 7e     subi 3f,ret0,ret0
  10:   01 7c 18 40     mtsar ret0
  14:   73 dc 3f 91     std ret0,-38(sp)
  18:   08 1c 02 53     copy ret0,r19
  1c:   37 5a 3f ef     ldo -9(r26),r26
  20:   d7 9f 12 1d     depdi,z,* -1,sar,32,ret0
  24:   db 5a 0f e0     extrd,s,* r26,63,32,r26
  28:   01 7a 18 c0     mtsarcm r26
  2c:   f7 ff 00 00     depdi,z,* -1,63,32,r31
  30:   d3 ff 17 00     extrd,s,* r31,sar,64,r31
  34:   01 73 18 40     mtsar r19
  38:   d7 ff 03 00     depd,z,* r31,sar,64,r31
  3c:   0b 9f 78 a0     cmpclr,*> r31,ret0,r0
  40:   08 1f 02 5c     copy r31,ret0
  44:   e8 40 d0 00     bve (rp)
  48:   37 de 3f 81     ldo -40(sp),sp
  4c:   01 7c 18 c0     mtsarcm ret0
  50:   d7 9f 12 1d     depdi,z,* -1,sar,3,ret0
  54:   e8 40 d0 00     bve (rp)
  58:   37 de 3f 81     ldo -40(sp),sp
  5c:   00 00 00 00     break 0,0

I think that blkbits is 12, so the depdi instructions (0x2c and 0x50) do:
shift a -1 of length 3 by 12 bits, which is 28672. Reading the C code they
should do "of length 32", so I fear gcc is somehow damaging it's length
output here.

A part from the 32 bit code looks like this:

  9c:   01 7c 18 40     mtsar ret0
  a0:   d7 9f 18 01     depwi,z -1,31,31,ret0
  a4:   d6 bf 10 00     depwi,z -1,sar,32,r21
  a8:   08 14 02 5d     copy r20,ret1
  ac:   01 7a 18 40     mtsar r26
  b0:   d3 80 00 1a     shrpw r0,ret0,sar,r26

So here a 32 bit -1 is used if I'm reading this correctly.

My current 2.6.39.2 kernel is built with the same compiler (4.5.3) and
runs fine, while 3.x doesn't work. That likely comes because the later of
those shift things has been fixed in
f17722f917b2f21497deb6edc62fb1683daa08e6, and the former is never hit.
I've also compiled this file with 4.6.2, but the ASM code looks the same.

Dave, any idea?

Eike
