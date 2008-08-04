From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Cupertino test ring problem?
Date: Mon, 4 Aug 2008 11:34:12 -0400 (EDT)
Message-ID: <20080804153412.D8CA54EAE@hiauly1.hia.nrc.ca>
References: <7d01f9f00808040159ud7f1afw8e0ee77760bc9c68@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@parisc-linux.org, linux-parisc@vger.kernel.org
To: T-Bone@parisc-linux.org (Thibaut VARENE)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00808040159ud7f1afw8e0ee77760bc9c68@mail.gmail.com> from "Thibaut VARENE" at Aug 4, 2008 10:59:08 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Is there a source tarball of that, or a list of applied patches? I
> would very much like to use that "homebrew" kernel on my cluster as
> well, until newer kernels are proven reliable enough...

I built a tar ball, linux-2.6.22.19-jda.tar.gz.  It is in my home directory
on gsyprf11.  The source is also there.  The most important patch is
compat_sys_getdents.d from Kyle.  The base is linux-2.6.22.19.tar.bz2
from kernel.org.  The .config file was derived from some earlier config
file on this machine (can't remember which).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
