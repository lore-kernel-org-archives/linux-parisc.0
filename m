Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F7774829
	for <parisc-linux@parisc-linux.org>; Thu,  7 Nov 2002 00:31:37 -0700 (MST)
Date: Thu, 7 Nov 2002 08:31:18 +0100
Message-ID: <3DA3DE66000044D1@ocpmta4.be.tiscali.com>
In-Reply-To: <3DB5755500002451@ocpmta7.be.tiscali.com>
From: jsoe0708@tiscali.be
Subject: RE: [parisc-linux] 2.5.45-pa5 failed to boot [was: gcc-3.3 hppa patch]
To: "Matthew Wilcox" <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

>>
>>On Wed, Nov 06, 2002 at 08:18:48AM +0100, jsoe0708@tiscali.be wrote:
>>> I also try to test a 2.5 (45-pa5) it compiles well (after application
>of
>>> an old tips [remove $$mulU from parisc_ksyms.c]) but failled to boot
>:((
>>> (Is somebody already reach to boot a 2.5 pa?)
>>
No success with gcc-3.3 so comeback to gcc-3.0.4 and my .config file copied
from 2.4.19-pa24 to 2.5.46-pa1.

I first have to remove jfs support (:(( I need it but just for test ...)
and (serial) MUX support (do not yet need). I also encounter some problem
with acxxx (but not need ...)

Finaly I obtain a a kernel which start to boot and ...
as a year ago my b2000 hang after "Searching for devices..." and the green
led of the ide cdrom stay light up. (Sorry but I do not remember what was
the fix , can somebody refresh my memory?)

Joel


-------------------------------------------------------------
Tiscali ADSL: Activation et 1er mois GRATUITS. Plus d'info... http://www.tiscali.be/FR/subs/adsl.asp
