Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA09814
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Dec 2000 16:06:00 -0700
Message-Id: <200012022308.SAA04397@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: alan@linuxcare.com.au (Alan Modra)
Date: Sat, 2 Dec 2000 18:08:08 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: rhirst@linuxcare.com, parisc-linux@thepuffingroup.com,
        gcc-patches@gcc.gnu.org
In-Reply-To: <Pine.LNX.4.21.0012021932030.21742-100000@front.linuxcare.com.au> from "Alan Modra" at Dec 2, 2000 11:35:19 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I prefer this patch, which strikes at the heart of the problem, and
> doesn't seem to cause any new problems.  (apart from an unnecessary
> register transfer at the end of some functions)
> 
> 	* flow.c (mark_regs_live_at_end): Set PIC_OFFSET_TABLE_REGNUM even
> 	when PIC_OFFSET_TABLE_REG_CALL_CLOBBERED.

The comment above is incorrect.  It should read "Set SET_REGNO_REG_SET for
PIC_OFFSET_TABLE_REGNUM if it is a fixed register".

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
