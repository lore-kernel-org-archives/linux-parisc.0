Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA21971
	for <parisc-linux@puffin.external.hp.com>; Mon, 1 Jan 2001 17:41:03 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id QAA13835
	for <parisc-linux@thepuffingroup.com>; Mon, 1 Jan 2001 16:44:19 -0800 (PST)
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: rth@redhat.com, alan@linuxcare.com.au, rhirst@linuxcare.com,
        parisc-linux@thepuffingroup.com, gcc-bugs@gcc.gnu.org
Subject: Re: pa reload problem 
Reply-To: law@redhat.com
In-reply-to: Your message of Sat, 30 Dec 2000 14:05:50 EST.
             <200012301905.OAA19130@hiauly1.hia.nrc.ca>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 01 Jan 2001 16:24:27 -0700
Message-ID: <23885.978391467@upchuck>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>


  In message <200012301905.OAA19130@hiauly1.hia.nrc.ca>you write:
  > Note that register 611 is dead at insn 1067.
Yes.


  > However, we still have REG_EQUIV
  > notes which implicitly use register 611 on insns 1091 and 1607 (not sure
  > why there isn't a note on 1627).
Err, no, that's not true.  There is no idea of an "implicit" use like
this.  

  > This leads to disaster at insn 1607
  > when the hard register assigned to 611 gets reused for other purposes
  > in the intervening code.
This indicates a reload bug to me.


  > Is the REG_DEAD note for register 611 in the right place?
Yes.
jeff
