From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] a stupid question about pdc_console?
Date: Tue, 14 Feb 2006 02:17:21 -0500
Message-ID: <20060214071721.GD13492@quicksilver.road.mcmartin.ca>
References: <43EF3AD8.7050803@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43EF3AD8.7050803@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Feb 12, 2006 at 01:40:40PM +0000, Joel Soete wrote:
> how printk() works before setup_arch() initialized his early console?
> (that works but how?)

it queues it until a console registers, and then it gets dumped.

(see register_console in kernel/printk.c)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
