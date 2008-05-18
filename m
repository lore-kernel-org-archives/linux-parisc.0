From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Git head doesn't boot on A500
Date: Sun, 18 May 2008 12:18:36 -0400
Message-ID: <20080518161836.GC6540@phobos.i.cabal.ca>
References: <7d01f9f00805170620t30630519h4890037400c62fb5@mail.gmail.com> <20080517152623.GA26649@colo.lackof.org> <7d01f9f00805171752r4eb8ee5nbfee8f832677f792@mail.gmail.com> <20080518071342.GB26649@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Thibaut VARENE <T-Bone@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080518071342.GB26649@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, May 18, 2008 at 01:13:42AM -0600, Grant Grundler wrote:
> So I don't understand how __HEAD works...and all the other arches are
> using ".text.head" (not .head.text) which has corresponding "code" in
> their vmlinux.lds.  Could someone kindly point out how .head.text 
> works for parisc?
> 

*(.text) will include .head.text...

>
