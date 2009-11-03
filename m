From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: hanging kernel - HPMC problem
Date: Tue, 3 Nov 2009 08:51:29 -0500
Message-ID: <119aab440911030551x2b7ecc0ajeabd4fcaaf479ec8@mail.gmail.com>
References: <4AF000CD.1010007@octogan.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Marek Denis <marek@octogan.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AF000CD.1010007@octogan.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Nov 3, 2009 at 5:07 AM, Marek Denis <marek@octogan.net> wrote:
> I suppose this is only kernel configuration issue.
> Here is the .config file that didn't work:
> http://pastebin.com/f45530dd7
>
> I would appreciate any help

I suggest:
* Remove all add-on cards from the hardware.
* Start with the generic config.
* Enable one thing at a time until it stops working.
* Come back to the list with a list of config options that don't work.

It's a slow and tedious process, but that's the only "easy" way to
solve the problem.

Cheers,
Carlos.
