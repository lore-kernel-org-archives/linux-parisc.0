Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA24042
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Nov 1999 06:52:45 -0700
Date: Thu, 25 Nov 1999 14:24:33 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
        Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        sieler@allegro.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress - Update
Message-Id: <19991125142433.P1009@mathe.stud.uni-erlangen.de>
References: <199911250031.TAA24156@hiauly1.hia.nrc.ca> <E11qnXB-0007Cl-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E11qnXB-0007Cl-00@the-village.bc.nu>
List-ID: <linux-parisc.vger.kernel.org>

> > Anybody know where or how the pointer "current" is defined?  It is not 
> > in the map.  I think it is supposed to point current processes task_struct.

include/asm-parisc/current.h

static inline struct task_struct * get_current(void)
{
        struct task_struct *current;

        asm("copy 30,%0" : "=r" (current));
        
        return (struct task_struct *)((long) current & (~8191));
}
 
#define current get_current()

> current is a macro getting the task struct by manipulating %esp

GR30 in our case.

	Philipp Rumpf
