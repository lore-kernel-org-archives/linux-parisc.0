From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] interesting linker behaviour :)
Date: Tue, 21 Sep 2004 18:21:49 -0400 (EDT)
Message-ID: <200409212221.i8LMLo6J011546@hiauly1.hia.nrc.ca>
References: <20040921220458.GH13248@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040921220458.GH13248@baldric.uwo.ca> from "Carlos O'Donell" at
	Sep 21, 2004 06:04:59 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Good catch!  I've hit this problem before but under HP-UX.  GAS doesn't
> > support the alternate entry point fixup needed to support multiple
> > entry points to a function.  I don't think anyone has tried to support
> > this with the ELF tools.  There could be some nasty interactions with
> > the HP unwind data when you start adding multiple entry points to a
> > function.
> 
> I think you said we had similar problems with non-local goto's?

Right, that's where it came up.  As of 6/11/04, we have a new nonlocal_goto
expander.  I'm a little foggy on this issue but I think prior to the
tree-ssa merge the default nonlocal_goto expander was ok.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
