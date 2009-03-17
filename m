From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: hpmc on rp3440 with 2.6.29-rc5
Date: Mon, 16 Mar 2009 20:51:47 -0400
Message-ID: <20090317005147.GD4282@bombadil.infradead.org>
References: <20090317004802.22B564E9D@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090317004802.22B564E9D@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Mar 16, 2009 at 08:48:01PM -0400, John David Anglin wrote:
> Below is some info that I collected from a HPMC that occurred running the GCC
> testsuite.  I believe this kernel was built with the master branch from
> Kyle's parisc-2.6.git tree.
> 
> In the info below, I only included relevant data.  No hpmc data was
> recorded for processors 2 and 3.  Unfortunately, I lost the console output
> for the crash if any.
> 
> This is with a SMP 64-bit kernel.  I still have it and the config file.
> 
> I'm not the greatest at interpreting chassis codes.  It's not at all clear
> to me what went wrong.
>

Good catch, looks like we're missing a compat handler for msgctl. I'll
add one and hopefully this will go away. :)

regards ,Kyle
