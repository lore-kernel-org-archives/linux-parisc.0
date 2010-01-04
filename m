From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Mon, 4 Jan 2010 13:02:36 -0500
Message-ID: <119aab441001041002r4757d4f9re9f8c54e0049090b@mail.gmail.com>
References: <20100104162732.10090@gmx.net>
	 <20100104173239.6C0AF5183@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	dave.anglin@nrc-cnrc.gc.ca
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100104173239.6C0AF5183@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jan 4, 2010 at 12:32 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> e) Thus the child either crashes, overwrites memory of the parent or does other things wrong.
>
> I don't see how the forked child can affect the memory of the parent.
> It can close files and affect the parent that way (child should use
> _exit and not exit).
>
> If the forked child actually overwrites memory of the parent, this is
> a big bug in the linux fork code.

We have two bugs that are getting mixed here.

Your original post has to do with a futex wait failure, this is
possibly related to the hppa low level lock implementation. I am
updating the hppa implementation to see if I can fix this for you.

Helge's comments relate only to the vfork crash, and the Qt thread
creation issue being seen by debian.

Cheers,
Carlos.
