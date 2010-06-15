From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] parisc: add tty driver to PDC console
Date: Tue, 15 Jun 2010 07:35:53 -0400
Message-ID: <20100615113553.GP20317@bombadil.infradead.org>
References: <20100614192441.245da011@zombie> <20100615133410.044ea5b1@borg.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100615133410.044ea5b1@borg.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 15, 2010 at 01:34:10PM +0200, Guy Martin wrote:
> On Mon, 14 Jun 2010 19:24:41 +0200
> Guy Martin <gmsoft@tuxicoman.be> wrote:
> 
> > 
> > 
> > This patch adds a tty driver to the PDC console. It allows the use
> > of ports not supported by linux as a console (e.g. serial port on
> > C3600).
> 
> Err, I meant the C8000.
> 

I figured... I'll take a look at it over the weekend. (Also, I'll see if
I can dig up the radeonfb hacks.)

--Kyle
