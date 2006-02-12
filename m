From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] a stupid question about pdc_console?
Date: Sun, 12 Feb 2006 13:40:40 +0000
Message-ID: <43EF3AD8.7050803@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
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

Hello pa*,

afaik our pdc_console is the very early console that kernel has to printout early msg?

if yes could we anyway printk before this console is initialized?

(see arch/parisc/kernel/setup.c
in setup_arch()
we printk the kernel bit width (32/64 bits) just before pdc_console_init(), though?)

TIA,
	Joel

PS: don't much understand how in init/main.c
[...]
     441 asmlinkage void __init start_kernel(void)
     442 {
     443         char * command_line;
     444         extern struct kernel_param __start___param[], __stop___param[];
     445 /*
     446  * Interrupts are still disabled. Do necessary setups, then
     447  * enable them
     448  */
     449         lock_kernel();
     450         page_address_init();
     451         printk(KERN_NOTICE);
     452         printk(linux_banner);
     453         setup_arch(&command_line);
     454         setup_per_cpu_areas();
[...]

how printk() works before setup_arch() initialized his early console?
(that works but how?)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
