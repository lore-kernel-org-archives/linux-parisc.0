From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: C8000 serial port
Date: Sat, 24 Apr 2010 08:44:11 -0600
Message-ID: <20100424144411.GA25138@lackof.org>
References: <20100423122701.259de41e@borg.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100423122701.259de41e@borg.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Apr 23, 2010 at 12:27:01PM +0200, Guy Martin wrote:
> 
> Hi team,
> 
> I recently bought a C8000 and I just can't get the serial ports to
> work. What modules should be used ? The normal 8250 modules don't work.

When we did original bring up C8000, we had to use an add-on PCI serial
card to get console with linux. I don't recall where the built-in
serial is attached but thought we had it working at some point. Maybe not.

grant
