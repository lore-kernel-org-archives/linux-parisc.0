Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA32045
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Jan 2001 14:15:47 -0700
Received: from slagheap.cygnus.com (cse.cygnus.com [205.180.230.236])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id NAA17463
	for <parisc-linux@thepuffingroup.com>; Tue, 23 Jan 2001 13:18:35 -0800 (PST)
To: Cary Coutant <cary@cup.hp.com>
cc: "Matthew Wilcox" <matthew@wil.cx>, "Alan Modra" <alan@linuxcare.com.au>,
        "Richard Hirst" <rhirst@linuxcare.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] parisc64 kernel and ret1 (gr29) setup 
Reply-To: law@redhat.com
In-reply-to: Your message of Tue, 23 Jan 2001 10:47:41 PST.
             <200101231850.KAA26800@adlmail.cup.hp.com>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 23 Jan 2001 14:17:48 -0700
Message-ID: <5101.980284668@slagheap.cygnus.com>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>

  In message <200101231850.KAA26800@adlmail.cup.hp.com>you write:
  > Several years ago we made an attempt to establish a 64-byte stack frame 
  > alignment in the 32-bit conventions, so that the compiler could take 
  > advantage of certain cache hints available on some PA-RISC CPUs. Because 
  > of the complexity of assuring that all stack frames in a program obeyed 
  > this convention, and the growth in average stack use, we abandoned the 
  > idea.
  > 
  > I don't believe, however, that we ever fixed the 32-bit conventions 
  > document to reflect this reversal. Unfortunately, it still says that sp 
  > must be 64-byte aligned. Trust me -- it's wrong. We've never enforced a 
  > 64-byte alignment.
Correct.  I believe it was roughly 1993 when I first saw the 64byte stack
frame alignment in an ABI spec for 32bit PA/HPUX and twiddled GCC
appropriately.

In 1995 GCC's optimizers were made smarter in terms of removing redundant
pointer arithmetic and logical ops which exposed the fact that hpux wasn't
actually providing a 64byte aligned stack :-)  And (of course) I had to
re-adjust the known stack alignment for the PA port to reflect reality.

I haven't looked in any of the newer ABI docs to see if this was ever
corrected.

jeff
