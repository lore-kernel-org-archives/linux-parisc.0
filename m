Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA31939
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 09:52:21 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id IAA21984
	for <parisc-linux@thepuffingroup.com>; Tue, 2 Jan 2001 08:55:32 -0800 (PST)
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: rth@redhat.com, alan@linuxcare.com.au, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org
Subject: Re: PATCH: Adjust label usage count for new insns [was Re: pa reload
 problem]
Reply-To: law@redhat.com
In-reply-to: Your message of Sat, 16 Dec 2000 15:38:02 EST.
             <200012162038.PAA25535@hiauly1.hia.nrc.ca>
From: Jeffrey A Law <law@redhat.com>
Date: Tue, 02 Jan 2001 02:51:32 -0700
Message-ID: <26318.978429092@upchuck>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>


  In message <200012162038.PAA25535@hiauly1.hia.nrc.ca>you write:
  > 2000-12-14  John David Anglin  <dave@hiauly1.hia.nrc.ca>
  > 
  > 	* loop.c (add_label_notes): Increment the label usage count when
  > 	a note is added to an insn which refers to a CODE_LABEL.
  > 	* gcse.c (add_label_notes): Likewise.
Thanks.  Installed.

jeff
