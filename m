Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflashcom (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A886482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 05:22:09 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@pflash.com>
To: Albert Strasheim <fullung@ilink.nis.za>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] new cd-images any time soon?
Date: Thu, 25 Oct 2001 06:19:44 -0500
References: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D94C@umr-mail03.cc.umr.edu> <20011024163506.A2752@parcelfarce.linux.theplanet.co.uk> <20011024201423.A16100@dogbert.localdomain>
In-Reply-To: <20011024201423.A16100@dogbert.localdomain>
MIME-Version: 1.0
Message-Id: <01102506194400.09585@Wolf-01>
List-ID: <linux-parisc.vger.kernel.org>

On Wednesday 24 October 2001 01:14 pm, Albert Strasheim wrote:
> - - snip - -
> Any chance of the 720/50 being fixed by then? :-) 

Albert & group,

I have not given up on the "loop on LDCW" problem you have found, but...

It is not likely that I will have the changes ready in time for the next iso.

I do have the LDCW target word being put into .o files with proper alignment, 
with or without initialization.
I DO NOT have the change cleanly intigrated into the source.

Mike
