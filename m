Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 2 Feb 2003 23:07:11 -0700
To: "Aaron St. Pierre" <asp@ungod.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel compile
Message-ID: <20030203060711.GG29454@dsl2.external.hp.com>
References: <20030203020247.GB1046@hadron> <20030203041122.GB29454@dsl2.external.hp.com> <20030203053336.GC1046@hadron> <20030203060359.GF29454@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030203060359.GF29454@dsl2.external.hp.com>
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

On Sun, Feb 02, 2003 at 11:03:59PM -0700, Grant Grundler wrote:
> If you don't get any other hot tips, start disabling things in
> the .config that you don't need: Parport, SBA/LBA/IOSAPIC,
> USB, LCD/LED support, wireless, extra lan/scsi drivers, etc.

I forgot to mention STI drivers - ditch those if you are using
serial console even though I doubt they are the problem.

grant
