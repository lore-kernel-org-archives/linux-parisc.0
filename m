Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 16 May 2003 11:25:55 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Jaime Ash <jaime@urgoal.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030516172555.GA10530@dsl2.external.hp.com>
References: <20030513184232.GB14235@dsl2.external.hp.com> <NEBBJAILOLAHGDBEOCIOOELDDGAA.jaime@urgoal.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <NEBBJAILOLAHGDBEOCIOOELDDGAA.jaime@urgoal.com>
Subject: [parisc-linux] Re: Help configuring an HIL mouse on an HP 715. - (Major disaster! - Am I back at ground level 0?)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thu, May 15, 2003 at 12:09:25PM -0700, Jaime Ash wrote:
> Hi Grant,
> I did manage to recover by using a combination of the tips above (except
> that I had to modify the first tip to: "boot alt isl", instead)

yup - sorry about that. I'm going to move this conversation to
the parisc-linux mailing list since this revolves around the HIL
support in the kernel.

> Since I can't get "vmlinux-2.4.20-32" to boot in my machine,

Has anyone tried to running vmlinux-2.4.20-32 on 715/new (64/80/100)?
Also problems with HIL mouse/keyboard?

> I then got and
> installed "kernel-image-2.4.19-32" (to try to fix my HIL mouse/keyboard
> problem) but I now have a new problem: when I boot using the
> "vmlinux-2.4.19-32" kernel, things go well until I reach a point where I get
> a Debian GNU Linux blue screen with a gray menu that asks to "Choose your
> current network-environment !", and gives 2 choices: "Installation_default"
> and "Set_up_new_environment" and has 2 "buttons": "< OK >" and "< Cancel >".
> But, the keyboard (and mouse) are disabled, so I can't choose!!!!!

Reboot with 2.4.17, and fix up the network scripts. Or just delete the
whatever package provides that.
Can someone advise Jaime on which packages muck with keyboard settings
and how they should be set?
Or Is the FAQ answer this sufficiently?

> (Ie. I
> can't proceed or shutdown gracefully, because the networking hasn't yet been
> enabled - so I can't telnet to the machine - so my only choice is to pull
> the AC plug, because pressing the power button doesn't halt the system!)
> I believe that the "Choose your current network-environment !" blue screen
> occurs in my system because of a wrong default I took during the
> installation from the ISO disk (I didn't know any better!) and I used to get
> that same screen with "vmlinux-2.4.17-32".  But, in that case, I was able to
> make the proper choice with the keyboard, since it continued working OK up
> to that stage in the boot process.
> I may be wrong, but here is my theory of what's happening now:  the good
> news is that I think the new kernel ("vmlinux-2.4.19-32") must have "solved"
> the HIL/keyboard problem (but too early): ie. the HIL driver must have been
> enabled before the blue screen menu (since the keyboard behavior has changed
> with the new kernel), but the software behind that menu doesn't know how to
> use the new driver.  I also think that if I can somehow get rid of the blue
> screen (by changing an entry in some configuration file? - but which?) my
> problem would go away.  Since a previous user (Damien) reported that he got
> "kernel-image-2.4.19-32" to work for him in an HP 715 machine, I am guessing
> that he did not have that blue screen menu enabled - therefore no problem in
> his case.
> What do you think?

I don't know what the problem is. I haven't played with HIL drivers at all.

> Is there an easy way to disable the blue screen after booting to the old
> kernel?

Yes
1) figure out which script is presenting that menu.
   (eg "fgrep -i new_network /etc/init.d/*")
2) Run the script by hand to make sure it's the right one.
   (eg "/etc/init.d/netenv start")
3) "dpkg -S <scriptname>" to find the responsible package.
4) "apt-get remove <package>" to blow away the package.

hth,
grant
