From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Mon, 24 Apr 2006 10:25:45 -0600
Message-ID: <20060424162545.GA25893@colo.lackof.org>
References: <200604231206.53217.mszick@morethan.org>
	<200604241535.k3OFZmPJ027261@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604241535.k3OFZmPJ027261@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Apr 24, 2006 at 11:35:48AM -0400, John David Anglin wrote:
> The intent of the errata seems to be to relax the alignment requirement
> for ldc[dw],co in cases where the spinlock is not being shared with a
> non-coherent I/O device.

AFAIK, only one non-coherent PA-RISC box has PA2.0 and parisc-linux
doesn't support it: T600.

(I'm assuming ",co" completer is PA2.0 only - please correct me if
that's wrong.)

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
