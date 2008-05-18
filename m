From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: uid/gid issues on 2.6.26-rc2
Date: Sun, 18 May 2008 16:41:50 -0400 (EDT)
Message-ID: <20080518204150.A520B4E43@hiauly1.hia.nrc.ca>
References: <7d01f9f00805181331y77b83a35jb897b622f163b0ef@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: T-Bone@parisc-linux.org (Thibaut VARENE)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00805181331y77b83a35jb897b622f163b0ef@mail.gmail.com> from "Thibaut VARENE" at May 18, 2008 10:31:13 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I'm sorry to be yet again just a whistle blower, I couldn't dig that
> situation more yet but I'd like to raise awareness in case someone
> else experiences the same symptoms. Also, what I'm seeing is a major
> security flaw...
> 
> I'm running TOB on my A500 nosmp (when running SMP the timer code
> borks gently). Randomly, the system seems to goof off regarding uids
> and gids.

I've seen the same with various 2.6.25 32-bit builds.  Haven't seen
it with 64-bit builds.  However, the 64-bit builds haven't been particularly
stable (a few hpmcs).  That's why I still like 2.6.22.19 with Kyle's
compat_sys_getdents, and a few minor bug fixes.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
