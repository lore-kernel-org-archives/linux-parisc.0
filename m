Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA07524
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Sep 2000 14:39:24 -0600
Message-Id: <200009122039.NAA04751@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] Incompatibility of PIC and non-PIC
Date: Tue, 12 Sep 2000 13:39:47 -0700
From: Cary Coutant <cary@cup.hp.com>
To: "David Huggins-Daines" <dhd@linuxcare.com>,
        "Alan Modra" <alan@linuxcare.com.au>
Cc: <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>Shared libraries work well, but we've got a bigger problem now.  Our
>PIC and non-PIC code models are mutually incompatible in a big way
>(due to the use of %r19 And, it seems, while it's fine if non-PIC
>can't be used in shared libraries, it's not all right if PIC can't be
>linked statically.
> ...
>For that matter how does 32-bit HP/UX solve this issue?

When the HP-UX linker is building an a.out, it converts any r19-relative 
references into dp-relative references by rewriting the instructions. It 
still creates a linkage table entry if necessary (i.e., it doesn't 
rewrite a DLT-indirect reference as a direct dp-relative reference), but 
the linkage table entries are accessed via the dp register instead of r19.
