Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 934784A9F
	for <parisc-linux@parisc-linux.org>; Sat,  6 Oct 2001 19:13:05 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15q2V6-0007M9-00; Sun, 07 Oct 2001 02:13:04 +0100
Date: Sun, 7 Oct 2001 02:13:04 +0100
From: Matthew Wilcox <willy@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] resources
Message-ID: <20011007021304.H3745@parcelfarce.linux.theplanet.co.uk>
References: <20011007013044.G3745@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011007013044.G3745@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Sun, Oct 07, 2001 at 01:30:44AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Oct 07, 2001 at 01:30:44AM +0100, Matthew Wilcox wrote:
> 00000000-1ffffffff : System RAM
>   00000000-000009ff : PDC data (Page Zero)
>   00100000-0032bfff : Kernel code
>   0032c000-0049ed7b : Kernel data

Fixed it:

# cat /proc/iomem
00000000-efffffff : System RAM
  00000000-000009ff : PDC data (Page Zero)
  00100000-0032bfff : Kernel code
  0032c000-0049ed7b : Kernel data
f0000000-f00fffff : System ROM
100000000-1ffffffff : System RAM

I'll commit the diff shortly.

-- 
Revolutions do not require corporate support.
