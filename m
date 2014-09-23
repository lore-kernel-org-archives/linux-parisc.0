From: John David Anglin <dave.anglin@bell.net>
Subject: Re: FIX MES in init.c
Date: Tue, 23 Sep 2014 16:59:20 -0400
Message-ID: <BLU436-SMTP6279A45A0CDDB3AC2C3BDF97B00@phx.gbl>
References: <54207769.2020105@gmail.com> <5421DC9F.2080504@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Cc: akpm@linux-foundation.org, himangi774@gmail.com,
	julia.lawall@lip6.fr, mgorman@suse.de,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Helge Deller <deller@gmx.de>, nick <yocto6@gmail.com>,
	jejb@parisc-linux.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5421DC9F.2080504@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9/23/2014 4:48 PM, Helge Deller wrote:
> The FIXME: is misleading. It should maybe better read "HINT:" or 
> something like that.
> Trivially it's basically just casting the symbol so that the compiler
> will produce the correct code later on.
> There is nothing you could try to "fix".
Why not just remove "FIXME: " from these comments?

Dave

-- 
John David Anglin    dave.anglin@bell.net

