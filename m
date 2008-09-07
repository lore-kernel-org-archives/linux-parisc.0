From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: last git update of parisc-2.6.git failed again to merge???
Date: Sun, 7 Sep 2008 12:25:01 -0400
Message-ID: <20080907162501.GD20992@phobos.i.cabal.ca>
References: <48C3C03E.2050405@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <48C3C03E.2050405@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Sep 07, 2008 at 11:51:26AM +0000, Joel Soete wrote:
> Hello Kyle,
>

The history is non-linear, because I rebased it:

git fetch origin; git reset --hard origin/master

while on your master branch should resolve it. But be careful, it
will remove any of your local changes.
