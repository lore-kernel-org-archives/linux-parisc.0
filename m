Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id RAA14960
	for <parisc-linux@sod.res.cmu.edu>; Mon, 19 Apr 1999 17:04:26 -0400
Message-Id: <199904192104.OAA06003@cllmail.cup.hp.com>
Subject: Re: [parisc-linux] kernel updates.
Date: Mon, 19 Apr 1999 14:04:41 -0700
From: Cary Coutant <cary@cup.hp.com>
To: "Alex deVries" <adevries@redhat.com>,
        "Ulrich Drepper" <drepper@cygnus.com>
cc: <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>> > And the answer to this is:  
>> > - the only docs we have for 32 bit ELF from HP are quite old
>> > - if they're incomplete, it's up to us fill in the information
>> > - this is a good forum to ask directed questions on this topic
>> 
>> The question is: "is the documentation incomplete or wrong?".
>
>My understanding is that that documentations' always been incomplete, but
>not wrong.  Really the best person to talk to is Cary.  Cary?

The latest ELF supplement for PA-RISC is Version 1.5, dated August 20, 
1998. I'll send it separately to you, Alex, and you can post it on your 
web page (easier than getting HP's external web server updated). 

This document covers both 32-bit and 64-bit programs, but notes that ELF 
files are supported on HP-UX only for 64-bit programs. Nevertheless, a 
complete set of 32-bit relocations is listed in the document (and, yes, 
some 32-bit relocations have the same number and meaning, but different 
names, as 64-bit relocations).

The document also doesn't contain either Elf-32 or Elf-64 structure 
definitions. I have a separate document that describes Elf-64, but we 
defer to outside documentation for the Elf-32 format (e.g., the SVR4 gABI 
document).

If there are areas considered incomplete, please let me know. I'll do my 
best to answer questions here (first), and update the documents (as I 
have time).

-cary
