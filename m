Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA30028
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 May 2000 21:48:50 -0600
Received: from adlmail.cup.hp.com (adlmail.cup.hp.com [15.0.100.30])
	by atlrel1.hp.com (Postfix) with ESMTP id 6173FED
	for <parisc-linux@thepuffingroup.com>; Wed, 10 May 2000 17:48:49 -0400 (EDT)
Message-Id: <200005102148.OAA07673@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] crti.S Nested procedures error 
Date: Wed, 10 May 2000 14:48:39 -0700
From: Cary Coutant <cary@cup.hp.com>
To: "Paul Bame" <bame@endor.fc.hp.com>, "Grant Grundler" <grundler@cup.hp.com>
Cc: <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

Have you tried this:

>    .globl _init
>	    .EXPORT _init,ENTRY
>	    .type    _init,@function
>    _init:
>	    .PROC
>	    .CALLINFO FRAME=64,CALLS,SAVE_RP,ENTRY_GR=3
>	    .ENTRY
>	    a few assembly statements

      .PROCEND

      .PROC
 	    .CALLINFO FRAME=64,CALLS,SAVE_RP,ENTRY_GR=3
      
>
>	    /***** pre-main() code to be inserted here *******/
>
>	    a few more assembly statements
>	    .EXIT
>	    .PROCEND

While you need to use .proc and .procend in pairs, that's not the case 
with .entry and .exit. If the assembler won't take this code, it should. 
Besides being useful for this case, it's also necessary to generate code 
like this for out-of-line pieces of procedures.

-cary
