Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 12 Jul 2003 11:54:30 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Jan Sporbeck <jan_lists@sporbeck-family.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] eisa configuration howto?
Message-ID: <20030712175430.GA27933@dsl2.external.hp.com>
References: <3F102709.10403@sporbeck-family.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F102709.10403@sporbeck-family.de>
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

On Sat, Jul 12, 2003 at 05:19:37PM +0200, Jan Sporbeck wrote:
> But i am stuck with the eisa configuration.
> Where do I register eisa cards?

Because of a lack of documentation on the eisacfg tool that knows
how to poke NVRAM, this hasn't been done yet.

> -Ive only done that on intel before, there was an userspace programm..

Yes. Maybe use HPUX + eisacfg to setup the eisa cards?

grant
