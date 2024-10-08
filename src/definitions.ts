export interface MyCustomPluginPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  setBackgroundColor(color: string): Promise<boolean>;
}
