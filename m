Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (unknown [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA6D4482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 May 2003 08:38:48 -0600 (MDT)
Date: Thu, 15 May 2003 16:38:17 +0200
Message-ID: <3EC39C0A0000002A@ocpmta8.freegates.net>
In-Reply-To: <200305141801.h4EI1ca3012585@hiauly1.hia.nrc.ca>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] RE: Dump module patche.
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: bruno_vidal@hpfrcu03.france.hp.com,
	grundler@dsl2.external.hp.com, parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Dave,

>
>
>> >Attachment: dump_modules-2.4.20-pa32.patch2
>> >
>> I apply it against last 2.4.20-pa35 (do not have any more pa22 :( ) (just
>> 2 hunk to remove). Unfortunately it failed to compile with following message:
>> `gcc-3.0 -print-libgcc-file-name` /usr/src/LKCD/hppa/linux-2.4.20-pa35-lkcd/arch/parisc/lib/lib.a
>> /usr/src/LKCD/hppa/linux-2.4.20-pa35-lkcd/lib/lib.a  \
>> 	--end-group \
>> 	-o vmlinux
>> fs/fs.o(.debug_info+0x6fbaf): undefined reference to `.L1225'
>> make: *** [vmlinux] Error 1
>> 
>> (Sorry I already met this kind of pb but do not remember how to solve
:()
>
>At first glance, this would appear to be a GCC bug.  If I was to guess,
>it's a problem with a label for a jump table being deleted.

I will try gcc-3.2 (or later) because

>
>You might be able to avoid the problem by compiling fs.o with a different
>optimization.  The problem could be investigated further by generating
>the assember output for the routine with -g.  Search for the above label.
>The debug information in the file will allow finding the source line.
>

fs.o is in fact a lib build with "ld -r -o fs.o open.o read_rite.o [...]"

and 'objdump -d fs.o' do not actualy help me to find back any above references
:(

Thanks,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
