Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA25069
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 Jan 2001 01:05:29 -0700
To: parisc-linux@thepuffingroup.com
Cc: lamont@hp.com
Date: Fri, 26 Jan 2001 01:09:19 -0700
From: LaMont Jones <lamont@security.hp.com>
Message-Id: <20010126080919.ABABC22907B@mix.fc.hp.com>
Subject: [parisc-linux] lif volume (correct) structs/values
List-ID: <linux-parisc.vger.kernel.org>


Not that anyone cares, but...

I created lif* utilities for x86 platforms (everything but lifspace()
should be working, so don't go trying to grow directory entries...
I'll work on that some more eventually, along with trying to submit
the sources into the hp-ux source tree for our decendants...

Of course, this led to the discover that PALO doesn't create LIF
images: it creates things that look enough like LIF images to make
the bootloader happy, but inside they are nothing like a LIF image...
(Which I'm sure comes as no surprise to most everyone, since the
objective was never more than that...)

Should someone want to have PALO create an actual LIF image, that would
be kind of cool.

If people would like the x86 LIF utility _BINARIES_, I'll be happy
to send them to you.  Of course, they won't work on any of the current
PALO LIF images, so I'm not sure what use they'd be to anyone.

(If someone wants to tell me I can release the source, then I'll be
happy to do that too, but I'm not going to work on that side of
things, given the above...)

lamont

=================================================================
/*
 * This defines a BCD date in the LIF format.
 * This may fail on some machines due to implementation-dependent
 * ordering of bit fields.  We expect the first byte to contain year1<<4+year2.
 */
struct date_fmt {
	unsigned year1	: 4;
	unsigned year2	: 4;
	unsigned mon1	: 4;
	unsigned mon2	: 4;
	unsigned day1	: 4;
	unsigned day2	: 4;
	unsigned hour1	: 4;
	unsigned hour2	: 4;
	unsigned min1	: 4;
	unsigned min2	: 4;
	unsigned sec1	: 4;
	unsigned sec2	: 4;
};

struct dentry {
	char fname[MAXFILENAME];	/* Name of file */
	short ftype;			/* Type of file or EOD (end-of-dir) */
	int start;			/* Starting sector */
	int size;			/* Size in sectors */
	char date[6];			/* Should be date_fmt, but on
					   some machines
					   date_fmt gets padded to 8 bytes */
	short lastvolnumber;		/* Both lastvolume flag & volume # */
	int extension;			/* Bizarre user-defined field */
};

struct lvol {
	unsigned short discid;		/* 0..65535, must be 0x8000 */
	char volname[MAXVOLNAME];	/* volume name */
	int dstart;			/* directory start, must be > 0 */
	short dummy1;			/* must be 4096 */
	short dummy2;			/* must be 0 */
	int dsize;			/* length of directory, must be > 0 */
	short version;			/* extension level */
	short dummy3;			/* must be 0 */
	int tps;			/* tracks / surface */
	int spm;			/* surface / medium */
	int spt;			/* sector / track */
	char date[6];			/* see dentry.date comment */
	unsigned short reserved1[99];
	int iplstart; 			/* IPL code location on media */
	int ipllength;			/* size of IPL code */
	int iplentry;			/* IPL entry blocksize for spectrum */
	unsigned short reserved[2];     /* 21..127 */
};

struct lfib { 
	int filedis;			/* fd on our LIF volume */
	int dindex;
	int dstart;			/* Where the directory starts */
	int lastsector;
	int dsize;			/* Size of directory */
	char dirpath[MAXDIRPATH];
	char filename[MAXFILENAME+1];
	struct dentry lfile;
	char buffer[HALF_K];
};

struct dpointer {		/* cat entry */
	int sector;   		/* sector */
	int index;    		/* buffer subscript */
	int start;    		/* data start */
};
=================================================================
