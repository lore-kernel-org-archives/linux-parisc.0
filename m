From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Segfault when ogg123 exits
Date: Tue, 11 Mar 2008 19:15:47 -0400
Message-ID: <119aab440803111615i2903c5a1td814c3fd14ef56c6@mail.gmail.com>
References: <20080305213128.GA27120@miranda.arrow>
	 <119aab440803101739l778c3220w9102f6d814839694@mail.gmail.com>
	 <20080311020956.GA4155@miranda.arrow>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: "Stuart Brady" <sdbrady@ntlworld.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080311020956.GA4155@miranda.arrow>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Mar 10, 2008 at 10:09 PM, Stuart Brady <sdbrady@ntlworld.com> wrote:
>  I just ran ogg123 in gdb with a breakpoint set on timer_create(), and it
>  didn't get triggered, so timer_create() itself seems unlikely to be the
>  problem, but I can certainly try chopping libao down a bit.

Excellent, this is exactly the way you want to track this down. You
may wish to run strace to see what types of system calls the program
is making.

Cheers,
Carlos.
