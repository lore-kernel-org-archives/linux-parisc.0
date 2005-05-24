From: Thibaut VARENE <varenet@esiee.fr>
Subject: Re: [parisc-linux] If this is the last message you see
Date: Tue, 24 May 2005 09:43:38 +0300
Message-ID: <20050524074339.5B553365917@mail.esiee.fr>
References: <20050524045149.GA867@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050524045149.GA867@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Grant Grundler wrote:
> On Mon, May 23, 2005 at 06:10:21PM -0300, Daniel Coletti wrote:
> > Hi,
> > Am I pointing to the right direction? or I have to change
something=20
> > else? What other values can I try?
> >=20
> > thanks a lot.
>=20
> Wasn't there a goofy card that needs to be removed from D-class
> in order for parisc-linux to work properly?
> Search the parisc-linux mail archive for "remove management card"
> or variants of that.

Actually no:

See
http://www.pateam.org/parisc-linux-boot/PA-RISC-Linux-Boot-HOWTO/hardw
are.html

"D class works unless you have a Remote Management Card installed.
Even then, it still kind of works, it's just that ttyS0 gets assigned
to the second serial port and you have to switch cables around."

HTH

T-Bone, still planning a release of the updated howto ;)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
