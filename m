From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] Re: [patch] use __u64 rather than u64 in parisc
	statfs structs
Date: Tue, 30 Jan 2007 21:14:05 -0500
Message-ID: <20070131021404.GA7088__32568.790499545$1416624272$gmane$org@athena.road.mcmartin.ca>
References: <200701281848.26804.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-kernel@vger.kernel.org,
 parisc-linux@lists.parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200701281848.26804.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jan 28, 2007 at 06:48:26PM -0500, Mike Frysinger wrote:
> the statfs header exports some structs to userspace ... the parisc statfs64 
> struct currently uses u64 so the trivial attached patch fixes it to use __u64
> -mike

ack'd and merged. can you please not attach patches but properly send them
inline so i don't have to edit them before applying them to my tree?
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
