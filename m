From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Call for Testing
Date: Mon, 28 Mar 2005 10:39:14 -0700
Message-ID: <20050328173914.GD10159__9325.78132856197$1416623728$gmane$org@colo.lackof.org>
References: <20050327204550.GC7728@roadwarrior.mcmartin.ca>
	<424817E2.10705@tiscali.be>
	<20050328152413.GB24913@roadwarrior.mcmartin.ca>
	<42483D20.1080104@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42483D20.1080104@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Mar 28, 2005 at 05:21:36PM +0000, Joel Soete wrote:
> just still have a small trouble with (builtin) nic:
> ...
> Configuring network interfaces...SIOCSIFADDR: No such device

The error normally means the driver didn't get loaded.
Several possible causes/fixes:
o See if module versioning is enabled and failed to load because
  of kernel/module version mismatch
o if it needs to be (but wasn't) included in the initrd.
o install hotplug package to autoload PCI drivers
o add driver to /etc/modules if you don't like hotplug package
  or want explicitly control over the order drivers get loaded.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
