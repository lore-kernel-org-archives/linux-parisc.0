From: Marek Denis <marek@octogan.net>
Subject: Re: hanging kernel - HPMC problem
Date: Tue, 10 Nov 2009 02:32:11 +0100
Message-ID: <4AF8C29B.6030408@octogan.net>
References: <4AF000CD.1010007@octogan.net> <119aab440911030551x2b7ecc0ajeabd4fcaaf479ec8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440911030551x2b7ecc0ajeabd4fcaaf479ec8@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Carlos O'Donell pisze:
> I suggest:
> * Remove all add-on cards from the hardware.
> * Start with the generic config.
> * Enable one thing at a time until it stops working.
> * Come back to the list with a list of config options that don't work.
> 
> It's a slow and tedious process, but that's the only "easy" way to
> solve the problem.

Actually, the only additional hardware is 2x 3COM network cards.
Unfortunately, after removing them from the server my custom kernel also 
hung with 'HPMC bus timeout'.
I will do as you advise, and try to remove one option at once in the 
kernel config.
Anyway, thanks for your help.

Marek Denis
