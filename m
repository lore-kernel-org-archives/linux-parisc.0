Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 21 Jan 2003 10:28:20 -0700
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] floppy images
Message-ID: <20030121172820.GB26882@dsl2.external.hp.com>
References: <5D69EA3878E6D411B43C00508BFD7283049FB535@exchange2.elgin.edu> <20030121163505.GB11363@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030121163505.GB11363@tausq.org>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Tue, Jan 21, 2003 at 08:35:05AM -0800, Randolph Chung wrote:
> > why are floppy images not supported like for i386?
> 
> I guess mostly because no one has asked for them, or been motivated
> enough to create them. Unlike i386, diskless installs for hppa work 
> very well....

and palo (boot loader) doesn't grok compressed vmlinuz images.
Patches are welcome...

> also, i think floppy drivers are not yet supported for many of the 
> parisc floppy controllers.

and HP couldn't published anything for floppy controller because of 
litigation at the time the parisc-linux work was being funded. :^(

FWIW, floppy controller support has been on the TODO list since day one.

grant
