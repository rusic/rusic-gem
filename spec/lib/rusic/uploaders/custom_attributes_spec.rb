require 'spec_helper'

RSpec.describe Rusic::Uploaders::CustomAttributes do
  before do
    @custom_attributes_uploader = Rusic::Uploaders::CustomAttributes.new(nil)

    allow(@custom_attributes_uploader).to receive(:attributes_file) {
      attributes_file = File.join(File.dirname(__FILE__), '..', '..', '..', 'fixtures', 'attributes.yml')
      YAML.load(File.open(attributes_file))
    }
  end

  it "returns params" do
    expect(@custom_attributes_uploader.params).to eq({
      custom_attribute_collections: [
        {
          key: "awesome_group",
          title: "Awesome Group Title",
          help_title: "Do something awesome",
          help_body: "Here is some help to being awesome",
          custom_attributes: [
            {
            "key" => "some_nested_text_1",
            "value" => "Example",
            "help_text" => "Example Help Text",
            "input_type" => "text",
            "select_options" => nil
            },
            {
              "key" => "some_other_text_1",
              "value" => "Example",
              "help_text" => "Example Help Text",
              "input_type" => "text",
              "select_options" => nil
            }
          ]
        },
        {
          key: "ok_group",
          title: "OK Group Title",
          help_title: "Do something average",
          help_body: "Here is some help to being alright",
          custom_attributes: [
            {
              "key" => "some_nested_text_2",
              "value" => "Example2",
              "help_text" => "Example Help Text",
              "input_type" => "text",
              "select_options" => nil
            },
            {
              "key" => "some_other_text_2",
              "value" => "Example2",
              "help_text" => "Example Help Text",
              "input_type" => "text",
              "select_options" => nil
            }
          ]
        }
      ]
    })
  end
end
