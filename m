Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id CAA13580
	for <hppa-linux@sod.res.cmu.edu>; Thu, 25 Mar 1999 02:09:54 -0500
Date: Wed, 24 Mar 1999 23:10:36 -0800 (PST)
From: Kumar <kumar@ix.netcom.com>
To: hppa-linux@thepuffingroup.com
cc: kumar@ix.netcom.com
Message-ID: <Pine.LNX.3.96.990324225944.502B-100000@quark.ix.netcom.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [hppa-linux] Qn on PA-RISC Page tables and TLB
List-ID: <linux-parisc.vger.kernel.org>



PA-RISC Arch 1.1 book says:
On page 3-14:

	Exact form of these tables is s/w convention. 

Q.	If the format is software convention, does that mean
	the fields within TLB slots are not defined by Hardware ?
	Though  the book does seem to indicate what fields are needed
	in a pdir entry. Without knowing exact positions of various
	fields how would TLB entries be updated from pdir entries in
	memory ?

	Other interesting point to note is that PA-RISC does not
	define how many entries in the table etc. Very much unlike
	x86.

-pkd
	
