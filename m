From: "Helge Deller" <deller@gmx.de>
Subject: Re: [GIT PULL] parisc fixes for v3.8-rc5
Date: Thu, 24 Jan 2013 11:27:56 +0100
Message-ID: <20130124102756.213380@gmx.net>
References: <50FF006C.7070803@gmx.de>
 <CAMuHMdViEAXdm=iYXeejdnxw_Xj_7HF63DcUojwBm-G+UeSeuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Cc: linux-kernel@vger.kernel.org, dave.anglin@bell.net,
	jejb@parisc-linux.org, linux-parisc@vger.kernel.org,
	torvalds@linux-foundation.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, deller@gmx.de
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdViEAXdm=iYXeejdnxw_Xj_7HF63DcUojwBm-G+UeSeuw@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Geert,

From: Geert Uytterhoeven <geert@linux-m68k.org>
> On Tue, Jan 22, 2013 at 10:11 PM, Helge Deller <deller@gmx.de> wrote:
> > please consider pulling the following 4 patches for 3.8-rc5 which
> improve
> > the stability of the linux kernel on the parisc architecture.
> 
> I think you forgot https://patchwork.kernel.org/patch/1917351/

I did not scheduled it as bug fix for 3.8, since the HPUX support is broken in the parisc tree anyway.

But I did not forgot your patch either. It's in my local git repository and will go in for kernel 3.9. That's why it's in state "accepted" in patchwork already.
I hope that's OK for you?

Helge
