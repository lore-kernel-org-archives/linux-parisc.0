Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 1 Oct 2002 23:00:22 -0600
To: Frank Cornelis <Frank.Cornelis@rug.ac.be>
Cc: James Smith <james@compusmithllc.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] firmware update using BOOTP
Message-ID: <20021002050022.GB1454@dsl2.external.hp.com>
References: <1033419379.4785.33.camel@seventy> <Pine.GSO.4.31.0210010927510.12081-100000@eduserv.rug.ac.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.GSO.4.31.0210010927510.12081-100000@eduserv.rug.ac.be>
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

On Tue, Oct 01, 2002 at 09:31:35AM +0200, Frank Cornelis wrote:
> I know, BOOTP booting also worked with me before the firmware patching.
> But anyway, upgrading never hurts and the HP/linux FAQ recommended it.

That's not true. Upgrades can fail. It's rare but it happens.
I wrote the FAQ entry and it also says:

| BEWARE: It's possible to kill a system by either upgrading the wrong
| firmware or the upgrade doesn't finish properly for any reason. Don't
| upgrade unless you have evidence of a PDC problem. Text files on the HP
| patch depot describe what was fixed in each revision since the machine
| model was released.

It's easy to download the wrong firmware to a machine.
My favorite example is installing 715/100 PDC on a 715/100XC (need a
"dagger" card and working 715/100XC to resurrect the dead 715/100XC).
I've done it and know of others who've done it. Sounds stupid but
it happens.

grant
