Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9E41B482A
	for <parisc-linux@parisc-linux.org>; Tue,  8 May 2001 17:41:57 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14xH6m-0004Sd-00; Wed, 09 May 2001 00:41:36 +0100
Date: Wed, 9 May 2001 00:41:36 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Andi <andi@fischlustig.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] framebuffer drivers, sound
Message-ID: <20010509004136.R4917@parcelfarce.linux.theplanet.co.uk>
References: <3AF878EA.3F043FD7@fischlustig.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3AF878EA.3F043FD7@fischlustig.de>; from andi@fischlustig.de on Wed, May 09, 2001 at 12:53:31AM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, May 09, 2001 at 12:53:31AM +0200, Andi wrote:
> The stifb driver is working for me, but the colors are completely wrong
> and the
> system crashes if i try to cat /dev/fb0.

Yup, the stifb is buggy.  Please, if you have time, it would be great
if you could help clean it up and get it working.  sticon works rather
better but it is still not great.  The STI docs are publically available
from the documentation page.

-- 
Revolutions do not require corporate support.
