
#include <command.h>
#include <pwm.h>
#include <vsprintf.h>
int do_mycmd(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
{
    int period_ns, duty_ns;
    int enable;
    char *endstr;

    if ( argc < 4 )
        return CMD_RET_USAGE; //to print usage information

    printf("argc is %d argv[1] is %s\n", argc, argv[1]);
    
    if (strncmp(argv[1], "config", 5) == 0)
    {
        if (argc != 6)
            return CMD_RET_USAGE;
        
        period_ns = dectoul(argv[4], NULL);
        duty_ns = dectoul(argv[5], NULL);

        pwm_config(0, duty_ns, period_ns);

    }
    return CMD_RET_SUCCESS;

}
U_BOOT_CMD(mypwm, 6, 0, do_mycmd, 
        "control pwm channels",
        "config <pwm_dev_num> <channel> <period_ns> <duty_ns> - config PWM\n"
        "Note: All input values are in decimal");