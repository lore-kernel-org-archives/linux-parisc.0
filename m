Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA02749
	for <parisc-linux@puffin.external.hp.com>; Fri, 31 Dec 1999 16:33:06 -0700
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id SAA31448
	for parisc-linux@thepuffingroup.com; Fri, 31 Dec 1999 18:35:50 -0500
Date: Fri, 31 Dec 1999 18:35:49 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19991231183549.D12629@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] termios
List-ID: <linux-parisc.vger.kernel.org>


I think the best thing to do with struct termios is to define it in a
way which is compatible with HPUX apps:

#  define NCCS 16

   typedef unsigned int tcflag_t;
   typedef unsigned char cc_t;
   typedef unsigned int speed_t;

#  ifdef _TERMIOS_INCLUDED
     struct termios {
        tcflag_t        c_iflag;        /* Input modes */
        tcflag_t        c_oflag;        /* Output modes */
        tcflag_t        c_cflag;        /* Control modes */
        tcflag_t        c_lflag;        /* Local modes */
        tcflag_t        c_reserved;     /* Reserved for future use */
        cc_t            c_cc[NCCS];     /* Control characters */
     };

As you can see, there are 4 bytes reserved before c_cc starts.  Linux
defines more than 16 NCCS, and also has a 1-byte field for the line
discipline.  So I propose:

struct termios {
        tcflag_t        c_iflag;        /* Input modes */
        tcflag_t        c_oflag;        /* Output modes */
        tcflag_t        c_cflag;        /* Control modes */
        tcflag_t        c_lflag;        /* Local modes */
	cc_t		c_line;		/* Line Discipline */
	cc_t		c_cc[19];	/* Control characters */
};

and then adjust the symbolic constants for VINTR et al to ensure they
still refer to the same offset within the structure.  Any comments?
I hope HP won't mind me using the reserved field in this way.
