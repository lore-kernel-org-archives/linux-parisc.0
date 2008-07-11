From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] fix comment in Light-weight-syscall code
Date: Fri, 11 Jul 2008 13:02:10 -0400
Message-ID: <119aab440807111002i2ed7079cu7a7c096b241784b7@mail.gmail.com>
References: <200807102204.15886.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: "Helge Deller" <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200807102204.15886.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jul 10, 2008 at 4:04 PM, Helge Deller <deller@gmx.de> wrote:
> The comment for the lws-atomic system call userspace helper
> function mentions r22 and r23 as input registers, but I couldn't
> find any usage of those registers in the code.
> This patch fixes this and corrects another small typo as well.

That's the LWS syscall ABI. It has 5 argument registers, 1 return
register, 1 error code register, and 1 lws number register.

Cheers,
Carlos.
