Return-Path: <hppa-linux@puffingroup.com>
Date: Tue, 2 Feb 1999 15:12:34 -0800 (PST)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199902022312.PAA13692@gatekeeper.equator.com>
To: adevries@redhat.com
Subject: Re: Some planning issues.
Cc: hppa-linux@puffingroup.com
Resent-Message-ID: <"Vg-TF2.0.Ch5.C0wjs"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


>
> Boot Loader
> -----------
>
> We need to figure out how to load a kerne image; I suspect borrowing from
> openbsd and mklinux will be great.
>
>

  I have knowledge of how this works from my time at HP. It is mildly
  complicated compared to other platforms. As far as I know, the document
  describing the process isn't available outside of HP but the mklinux
  guys obviously had access to it.
  I can get something going here if no one else volunteers. 

  Note that my machine is a C160 (64-bit PA8000 based). I think most of you
  have 700 series machines. I should be able to get one going that will work
  in w=0 (32-bit) mode so that it will also work with the 700 machines. But
  someone with a 700 will need to test it and possibly hack it.

>
> All of this is going to be terrifically difficult without someone with
> prior HPPA experience.  However, we do have OpenBSD and mklinux to model
> things after. And hopefully we'll have docs.
>

  These are good sources, but I hope we can get "real" docs from HP. There
  is tons of information about the PDC, IODC, boot process, and I/O 
  architecture that would be very useful -- and its a lot easier to read
  about than pick through code. I can give what I know/remember.

  Regards, Jason Eckhardt. 
