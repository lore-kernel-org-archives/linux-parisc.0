Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 23 Dec 2002 00:23:35 -0700
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20021223072335.GD19065@dsl2.external.hp.com>
References: <20021222090934.DE9654829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021222090934.DE9654829@dsl2.external.hp.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.5 deller
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

On Sun, Dec 22, 2002 at 02:09:34AM -0700, Helge Deller wrote:
> I didn't applied the CONFIG_DUMMY_CONSOLE related setup.c changes, instead
> I changed Kconfig in drivers/video/console. Please test.

I made the same comment to Lamont on IRC after looking at it again.
Kconfig is a better approach.

thanks,
grant
