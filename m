Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 4 Aug 2003 23:59:19 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030805055919.GA21815@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] stale references to io_request_lock
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

Willy,
your favorite scsi driver still has references to io_request_lock in
it's comments:
...
 *  The whole SCSI sub-system under Linux is basically single-threaded.
 *  Everything, including low-level driver interrupt routine, happens
 *  with the `io_request_lock' held.
...

I was looking at what else might not have been forward ported
and stumbled across this reference. Care to delete it?

thanks,
grant
