From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Anyone want to write a register across syscall
	consistency checker?
Date: Fri, 17 Sep 2004 10:38:48 -0400
Message-ID: <20040917143839.GG28936@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


pa,

Would someone like to write a program that does the following?


main
        for all syscalls
                setup syscall parameters
                save register state
                call syscall
                compare register state to previous saved
                if different then print difference
        end for
end main

This would be a nice tool :)
It would have caught our previous pic register corruption, and it might
reveal any other problems we might have in our syscall paths. It also
gets you very familiar with Linux syscalls!

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
