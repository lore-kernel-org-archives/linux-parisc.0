Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51267482A
	for <parisc-linux@parisc-linux.org>; Wed, 17 Apr 2002 09:45:10 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16xrc7-0004cI-00; Wed, 17 Apr 2002 16:44:55 +0100
Date: Wed, 17 Apr 2002 16:44:55 +0100
From: Matthew Wilcox <willy@debian.org>
To: Paul Bame <bame@fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] linux-2.4.18-pa19 fpu problem
Message-ID: <20020417164455.M23804@parcelfarce.linux.theplanet.co.uk>
References: <1019034174.3cbd3a3e2c5a5@webmail.tiscalinet.be> <20020417123211.L23804@parcelfarce.linux.theplanet.co.uk> <E16xqdU-0001WN-00@paul.bame>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E16xqdU-0001WN-00@paul.bame>; from bame@fc.hp.com on Wed, Apr 17, 2002 at 08:42:16AM -0600
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

On Wed, Apr 17, 2002 at 08:42:16AM -0600, Paul Bame wrote:
> Here's the README in the math-emu directory which describes why we
> leave the warnings in:
> 
> "All files except driver.c are snapshots from the HP-UX kernel.  They've
>  been modified as little as possible.  Even though they don't fit the
>  Linux coding style, please leave them in their funny format just in case
>  someone in the future, with access to HP-UX source code, is generous
>  enough to update our copies with later changes from HP-UX -- it'll
>  make their 'diff' job easier if our code is relatively unmodified.

Sure, but I don't think adding

#include "math-emu.h"

to each file will make anyone's life more difficult.  Nor even

float sfod(float, float);
float ssinf(double);
...

-- 
Revolutions do not require corporate support.
