Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 15 Aug 2003 00:16:01 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: caslivkoff@speakeasy.net
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
Message-ID: <20030815061601.GD2989@dsl2.external.hp.com>
References: <W9958529574305441060899998@webmail4>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <W9958529574305441060899998@webmail4>
Subject: [parisc-linux] Re: xchat colors
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

On Thu, Aug 14, 2003 at 10:26:38PM +0000, caslivkoff@speakeasy.net wrote:
> Also, I've attached is short Xlib program. This will report the
> number of private color cells remaining in the default colormap.

moving my .Xdefaults to Xdefaults-ggg got me two more colors with twm
(grand total of 12).

Another clue is messing with color settings in the
preferences gets me something visible in the text box.
Wierd is it mangled the xterm foreground for *new* xterms,
not the existing ones....at least until I restored my .Xdefaults
and opened new xterms.

Seems like I want to figure out how to setup a fixed color
map as suggest earlier by Alan Cox. Or fix xchat so it
doesn't attempt to get writeable colors until someone
messes with the color preferences.

thanks,
grant
